# Reflection

**1. How does writing a docker-compose.yml file make a cloud engineer's job easier compared to manually typing commands?**

A docker-compose.yml file makes things easier because all the settings for the containers are saved in one file. Instead of running several commands one by one, I can use a single command to start the application and database together. This saves time and makes the setup easier to repeat.

**2. What happens if you make an indentation error (like using a Tab instead of Spaces) in a YAML file?**

An indentation error can prevent Docker Compose from reading the YAML file correctly. Since YAML uses spaces to organize its structure, using a Tab can cause a parsing error when I run docker-compose up. This taught me to check the spacing and indentation carefully before starting the containers.

**3. Why did we use environment variables (like MYSQL_PASSWORD) in the Compose file?**

Environment variables allow us to pass important settings, such as database names, usernames, and passwords, to the containers. They make the configuration easier to manage because we do not have to change the application's setup every time a setting changes. For real projects, passwords should also be stored securely instead of being exposed in the Compose file.

**4. How did it feel to deploy a fully functional enterprise cloud storage system (Nextcloud) in just a few minutes?**

I felt happy and proud when I learned how to set up Nextcloud using Docker Compose. I was surprised that an application and its database could run in separate containers and work together with only a few commands. The activity helped me see how Docker makes application deployment easier and faster. It also made me more interested in learning how cloud services work in real-world situations.

**5. How has your understanding of Cloud Computing evolved since Mission 1?**

In Mission 1, I mainly thought of cloud computing as storing files and accessing services through the internet. After completing the activities, I gained a better understanding of how applications can be deployed, configured, and managed using tools like Docker and Docker Compose. In Missions 4 and 5, I learned more about setting up and managing the components needed for an application. This mission helped me understand how the web application and database work together, giving me a clearer picture of how cloud systems are built and maintained.
