# Use Alpine Linux as the base image
FROM alpine:latest

# Set environment variable for the remote.it registration code
ENV R3_REGISTRATION_CODE="B0CF56B7-E750-5B94-9476-65B9FD9677EB"

# Install required packages
RUN apk add --no-cache bash curl unzip libc6-compat

# Set the working directory
WORKDIR /bedrock-server

# Download Minecraft Bedrock server
RUN curl -o bedrock-server.zip -L https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.10.01.zip \
    && unzip bedrock-server.zip \
    && rm bedrock-server.zip

# Copy the start script into the container
COPY start.sh /bedrock-server/start.sh

# Make the start script executable
RUN chmod +x /bedrock-server/start.sh

# Install and register the remote.it agent
RUN sh -c "$(curl -L https://downloads.remote.it/remoteit/install_agent.sh)"

# Expose the Minecraft Bedrock default port
EXPOSE 19132/udp

# Set the entrypoint to run the start.sh script
ENTRYPOINT ["sh", "/bedrock-server/start.sh"]
