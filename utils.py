import os
import torch
import torchvision
from datasets import load_dataset
from transformers import AutoTokenizer
from PIL import Image
from matplotlib import pyplot as plt
from torch.utils.data import DataLoader


def plot_images(images):
    plt.figure(figsize=(32, 32))
    plt.imshow(torch.cat([
        torch.cat([i for i in images.cpu()], dim=-1),
    ], dim=-2).permute(1, 2, 0).cpu())
    plt.show()


def save_images(images, path, **kwargs):
    grid = torchvision.utils.make_grid(images, **kwargs)
    ndarr = grid.permute(1, 2, 0).to('cpu').numpy()
    im = Image.fromarray(ndarr)
    im.save(path)


def get_data(args):
    transforms = torchvision.transforms.Compose([
        torchvision.transforms.Resize(80),  # args.image_size + 1/4 *args.image_size
        torchvision.transforms.RandomResizedCrop(args.image_size, scale=(0.8, 1.0)),
        torchvision.transforms.ToTensor(),
        torchvision.transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
    ])
    tokenizer = AutoTokenizer.from_pretrained("bert-base-cased")
    dataset = load_dataset(args.dataset_path, split="train", sample_by="document")
    dataset = dataset.map(lambda example: {"length": len(example['text'])})
    dataset = dataset.filter(lambda example: example['length'] >= (args.min_size))
    dataset = dataset.sort('length')
    # TODO(sweiss): Bucket things by length so we don't need to pad files too much when batching
    dataset = dataset.map(lambda examples: tokenizer(examples["text"]), batched=True)
    dataset = dataset.shuffle()
    dataloader = DataLoader(dataset, batch_size=args.batch_size)
    return dataloader


def setup_logging(run_name):
    os.makedirs("models", exist_ok=True)
    os.makedirs("results", exist_ok=True)
    os.makedirs(os.path.join("models", run_name), exist_ok=True)
    os.makedirs(os.path.join("results", run_name), exist_ok=True)
