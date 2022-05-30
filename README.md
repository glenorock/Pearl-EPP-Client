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
  <li>You'll see a folder named conf, in which you shall fill in the following:</li>
  <ol>
    <li> The server.conf file shall contain the information neccessary connection into the EPP server </li>
  </ol>
</ol>

# TO DO

<ol>
  <li>Implement the controllers</li>
  <li>Implement a data formater (hash <-> JSON)</li>
  <li>Implement the REST API</li>
</ol>

# Run the server
In order to run the server, simply execute the <b> run.sh </b> file