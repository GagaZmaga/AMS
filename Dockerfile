FROM pytorch/pytorch:2.1.0-cuda12.1-cudnn8-runtime

RUN apt-get update
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python-is-python3
RUN apt-get update && apt-get install -y git


WORKDIR /home/galk/Testiranje #change to your own working directory

COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY utils ./utils
COPY test.sh .
COPY train.sh .
COPY inference_constricon.py .
COPY train_constricon_supervised.py .
COPY multiscale_constr_model.py .
COPY network_definition.py .
COPY Podatki_za_ucenje_izziv ./Podatki_za_ucenje_izziv

RUN mkdir -p /home/galk/Testiranje/Model #change to your own working directory
RUN mkdir -p /home/galk/Testiranje/Model/Results #change to your own working directory
RUN chmod -R 777 /home/galk/Testiranje/Model #change to your own working directory for writing and reading rights (not necessary)
RUN chmod +x test.sh
RUN chmod +x train.sh

# Default command
CMD ["bash"]
