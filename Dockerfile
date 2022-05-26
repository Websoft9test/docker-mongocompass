FROM kasmweb/desktop:1.10.0
USER root

ENV HOME /home/kasm-default-profile
ENV STARTUPDIR /dockerstartup
ENV INST_SCRIPTS $STARTUPDIR/install
WORKDIR $HOME


######### Customize Container Here ###########


RUN wget https://downloads.mongodb.com/compass/mongodb-compass_1.31.3_amd64.deb && dpkg -i mongodb-compass_1.31.3_amd64.deb \
    && cp /usr/share/applications/mongodb-compass.desktop $HOME/Desktop/ \
    && chmod +x $HOME/Desktop/mongodb-compass.desktop \
    && chown 1000:1000 $HOME/Desktop/mongodb-compass.desktop

######### End Customizations ###########

RUN chown 1000:0 $HOME
RUN $STARTUPDIR/set_user_permission.sh $HOME

ENV HOME /home/kasm-user
WORKDIR $HOME
RUN mkdir -p $HOME && chown -R 1000:0 $HOME

USER 1000