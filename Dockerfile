# Use the official .NET SDK image to build the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copy everything
COPY . ./

# Go to the subdirectory that contains the .csproj file
WORKDIR /app/TracktionApp

# Restore dependencies
RUN dotnet restore

# Build
RUN dotnet publish -c Release -o /app/publish

# Runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app
COPY --from=build /app/publish .

# Run the application
ENTRYPOINT ["dotnet", "TracktionApp.dll"]
