mkdir -p dataset
gsutil -m cp -r "gs://deepmind-gutenberg/train" dataset
gsutil -m cp -r "gs://deepmind-gutenberg/test" dataset
gsutil -m cp -r "gs://deepmind-gutenberg/validation" dataset