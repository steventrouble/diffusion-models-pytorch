# Fetches files from gutenberg

pip3 install text_to_image

fetch_and_convert () {
    wget --no-clobber -q $1
    python3 -m text_to_image.encode -f $(basename $1) $(basename $1).png 2> /dev/null
    rm $(basename $1)
}

mkdir -p jane_austen; cd jane_austen
fetch_and_convert https://www.gutenberg.org/cache/epub/158/pg158.txt
fetch_and_convert https://www.gutenberg.org/files/161/161-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/105/pg105.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/121/pg121.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/141/pg141.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/42671/pg42671.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/946/pg946.txt
cd ..

mkdir -p charles_dickens; cd charles_dickens
fetch_and_convert https://www.gutenberg.org/files/675/675-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/25985/pg25985.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/40723/pg40723.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/44578/pg44578.txt
fetch_and_convert https://www.gutenberg.org/files/46804/46804-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/1023/pg1023.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/28198/pg28198.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/23765/pg23765.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/37121/pg37121.txt
fetch_and_convert https://www.gutenberg.org/files/42232/42232-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/699/pg699.txt
fetch_and_convert https://www.gutenberg.org/files/653/653-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/821/pg821.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/1422/pg1422.txt
fetch_and_convert https://www.gutenberg.org/files/1400/1400-0.txt
fetch_and_convert https://www.gutenberg.org/files/809/809-0.txt
fetch_and_convert https://www.gutenberg.org/files/644/644-0.txt
fetch_and_convert https://www.gutenberg.org/files/927/927-0.txt
fetch_and_convert https://www.gutenberg.org/files/580/580-0.txt
fetch_and_convert https://www.gutenberg.org/files/924/924-0.txt
fetch_and_convert https://www.gutenberg.org/files/1289/1289-0.txt
fetch_and_convert https://www.gutenberg.org/files/98/98-0.txt
fetch_and_convert https://www.gutenberg.org/cache/epub/1465/pg1465.txt
cd ..
