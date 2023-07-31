# Use the official Ruby base image
FROM ruby:latest

# Set the working directory inside the container
WORKDIR /app

# Install dependencies using Bundler
RUN gem install bundler

# Copy the application code to the container
COPY . .

# Set the command to run your main.rb file
CMD ["ruby", "main.rb"]