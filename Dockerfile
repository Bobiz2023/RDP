# Use the dorowu/ubuntu-desktop-lxde-vnc image as the base image
FROM dorowu/ubuntu-desktop-lxde-vnc

# Expose port 80 to the outside
EXPOSE 80

# Set the default command to run the container
CMD ["sh", "-c", "export DISPLAY=:1 && vncserver :1 && tail -F /root/.vnc/*.log"]
