# Description 
This project provides a simple EPP client deployed in the form a Rest API

# Project Structure
The project is organised as such

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
  This file should follow the format <b> param = value <b> which each parameter being on its own line
  </li>
</ol>

# Run the server
In order to run the server, simply execute the command: 
<ul>
  <li><b> morbo server.pl </b> while in development environment, and </li>
  <li><b></b> while in production</li>
</ul>
