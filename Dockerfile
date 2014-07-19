# Based on ubuntu 14:04
FROM slok/vagrant-jdk
MAINTAINER Xabier Larrakoetxea <slok69@gmail.com>

# Install dependencies
RUN apt-get update
RUN apt-get install unzip

# Use vagrant user for the upcoming tasks
USER vagrant
WORKDIR /home/vagrant
ENV HOME /home/vagrant

# Download and Install GVM
RUN curl http://api.gvmtool.net -o /tmp/gvm-install.sh
RUN chmod 744 /tmp/gvm-install.sh
RUN /tmp/gvm-install.sh

# Prepare config for gvm and scripts
USER root
ADD config /home/vagrant/.gvm/etc/config
RUN chown vagrant:vagrant -R /home/vagrant/.gvm
RUN chmod 644 /home/vagrant/.gvm/etc/config
ADD install_components.sh /tmp/install_components.sh
RUN chown vagrant:vagrant /tmp/install_components.sh
RUN chmod 744 /tmp/install_components.sh

# Install Groovy and grails versions
USER vagrant
RUN /tmp/install_components.sh

# Clean
RUN rm /tmp/gvm-install.sh
RUN rm /tmp/install_components.sh

# Start the magic
CMD ["/sbin/my_init"]

USER root
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*