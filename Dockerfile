FROM jupyterhub/jupyterhub

RUN apt-get update && \
	apt-get install -y \
	apt-transport-https \
	emacs \
	ffmpeg \
	git \
	gnupg-agent \
	inkscape \
	jed \
	libsm6 \
	libxext-dev \
	libxrender1 \
	libx264-dev \
	lmodern \
	netcat \
	software-properties-common \
	texlive-xetex \
	texlive-fonts-recommended \
	texlive-generic-recommended \
	texlive-fonts-extra \
	tzdata \
	unzip \
	nano \
	vim \
	wget \
	x264

RUN pip install \
	coral-api \
	inaccel-keras \
	inaccel-scikit-learn \
	inaccel-vitis \
	ipywidgets \
	joblib \
	jupyterlab \
	matplotlib \
	numpy \
	opencv-python \
	pandas \
	Pillow \
	scipy \
	tqdm

RUN pip install --extra-index-url https://test.pypi.org/simple --no-cache-dir inaccel-h2o inaccel-xgboost

ARG version=1.8.7
RUN wget --quiet https://jfrog.inaccel.com/artifactory/generic/packages/debian/inaccel_${version}_amd64.deb && \
	dpkg --extract inaccel_${version}_amd64.deb tmp && \
	rm inaccel_${version}_amd64.deb && \
	mkdir --parents /usr/bin && \
	mv tmp/usr/bin/inaccel /usr/bin/inaccel && \
	rm --recursive tmp

ENV LC_ALL=C
ADD --chown=root:root files /

RUN echo "DIR_MODE=0750" >> /etc/adduser.conf && \
	adduser --disabled-password --gecos "" admin && \
	adduser --disabled-password --gecos "" parml01 && \
        adduser --disabled-password --gecos "" parml02 && \
        adduser --disabled-password --gecos "" parml03 && \
        adduser --disabled-password --gecos "" parml04 && \
        adduser --disabled-password --gecos "" parml05 && \
        adduser --disabled-password --gecos "" parml06 && \
        adduser --disabled-password --gecos "" parml07 && \
        adduser --disabled-password --gecos "" parml08 && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/admin/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml01/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml02/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml03/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml04/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml05/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml06/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml07/.bashrc && \
	echo "source /opt/xilinx/xrt/setup.sh > /dev/null" >> /home/parml08/.bashrc && \
	export PASS0=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
	export PASS1=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS2=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS3=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS4=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS5=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS6=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS7=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
        export PASS8=$(openssl rand -base64 14 | tr -d "=+/" | cut -c1-10) && \
	echo "admin:$PASS0" | chpasswd && \
	echo "parml01:$PASS1" | chpasswd && \
	echo "parml02:$PASS2" | chpasswd && \
	echo "parml03:$PASS3" | chpasswd && \
	echo "parml04:$PASS4" | chpasswd && \
	echo "parml05:$PASS5" | chpasswd && \
	echo "parml06:$PASS6" | chpasswd && \
	echo "parml07:$PASS7" | chpasswd && \
	echo "parml08:$PASS8" | chpasswd && \
	echo "admin:$PASS0" && \
	echo "parml01:$PASS1" && \
	echo "parml02:$PASS2" && \
	echo "parml03:$PASS3" && \
	echo "parml04:$PASS4" && \
	echo "parml05:$PASS5" && \
	echo "parml06:$PASS6" && \
	echo "parml07:$PASS7" && \
	echo "parml08:$PASS8"

CMD ["init.sh"]
