FROM sellpy/python3-jupyter-sklearn-java

RUN pip3 install --upgrade pip cython==0.29.21

RUN pip3 install --upgrade pip thinc==7.4.5

RUN pip3 install --upgrade pip \
    spacy==2.3.5 \
    Flask==1.0.2 \ 
    pandas==0.23.4 \
    numpy==1.16.0 \
    scikit_learn==0.20.1 \
    gdown

RUN python3 -m spacy download it
RUN python3 -m spacy download en

RUN apt-get install unzip

ARG GDRIVE_DL_LINK

RUN gdown https://drive.google.com/uc?id=${GDRIVE_DL_LINK}

# Add local files and folders
ADD / /app/amazon-kinesis-client-python/

RUN unzip -o models.zip

EXPOSE 9655

CMD [ "python3", "./starter.py" ]