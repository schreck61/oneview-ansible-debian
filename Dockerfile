FROM bobfraser1/ansible-debian

LABEL maintainer bobfraser1@gmail.com

WORKDIR /root

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -y \
    && apt-get install --no-install-recommends -y \
    curl \
    && apt-get clean \
    && apt-get autoremove -y \
    && pip install hpOneView \
    && rm -rf /var/lib/apt/lists/* /tmp/* /root/.cache \
    && curl -SL https://github.com/HewlettPackard/oneview-ansible/archive/v5.0.0.tar.gz | \
    tar xz \
    && mv oneview-ansible-5.0.0 oneview-ansible

ENV ANSIBLE_LIBRARY=/root/oneview-ansible/library
ENV ANSIBLE_MODULE_UTILS=/root/oneview-ansible/library/module_utils/

CMD [ "/usr/bin/ansible", "--version" ]
