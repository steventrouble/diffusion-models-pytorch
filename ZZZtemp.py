from utils import get_data

def main():
    import argparse
    parser = argparse.ArgumentParser()
    args = parser.parse_args()
    args.run_name = "DDPM_conditional"
    args.epochs = 300
    args.batch_size = 14
    args.image_size = 64
    args.num_classes = 10
    args.min_size = 2 ** 14
    args.max_size = 2 ** 18
    args.dataset_path = r"./dataset/"
    args.device = "cuda"
    args.lr = 3e-4
    dataloader = get_data(args)

if __name__ == '__main__':
    main()