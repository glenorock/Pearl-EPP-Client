# Description 
This project provides a simple EPP client deployed in the form a Rest API

# Project Structure
The project consist of 3 main files:
<ol> 
  <li><b>/conf/server.conf :</b> Configuration file containing the connecion details to the EPP server </li>
  <li><b>/lib/EPP/Client.pm :</b> Pearl module which provides us with an epp client </li>
  <li><b>server.pl:</b> This script is used to create a server which can be accessed by external systems</li>
</ol>

# Dependencies
In order to carry achieve this project, the following libraries were used

<ol>
  <li><b>Net::EPP </b> Provides a high level implementation of an EPP client</li> 
  <li><b>Mojolicious::Lite </b> Provides a means to create REST APIs </li>
</ol>

# Deployment
To deploy this open source on your terminal, you'll need to do the following.

<ol>
  <li>Ensure the dependencies mentioned above are installed. To do this, you can execute the <b>install.sh</b> file</li>
  <li>You'll see a folder named conf, in which you shall create a file named <b>server.conf</b> which shall contain the following
  <ol>
    <li>host</li>
    <li>user</li>
    <li>pass</li>
    <li>debug</li>
    <li>port</li>
    <li>timeout</li>
  </ol>
  This file should follow the format <b> param = value </b> with each parameter being on its own line
  </li>
</ol>

# Run the server
In order to run the server, simply execute the command <b> morbo -l http://*:3003 server.pl </b> while in development environment

# ToDo
<ol>
  <li> Implement a script which would run this  program as a deamon</li>
  <li> Customise the script to be run on a Linux VM (OS which was choosen for its deployment)</li>
</ol>