#build container
FROM mcr.microsoft.com/dotnet/sdk:5.0

WORKDIR /app

# Copy the solution and project files to the working directory
COPY . .

# Restore the packages and build the application
RUN dotnet restore
RUN dotnet build

# Publish the application
RUN dotnet publish -c Release -o out

# Set the working directory to the published application
WORKDIR /app/out

ENTRYPOINT ["dotnet", "Conduit.dll"]
# Use the official Microsoft .NET image as the base image

