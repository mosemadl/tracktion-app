# Use the correct .NET 9 runtime for the final container
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080

# Use the SDK image for building
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy the .csproj and restore dependencies
COPY TracktionApp/*.csproj ./TracktionApp/
RUN dotnet restore TracktionApp/TracktionApp.csproj

# Copy everything else
COPY . .

# Build and publish the app
WORKDIR /src/TracktionApp
RUN dotnet build -c Release -o /app/build
RUN dotnet publish -c Release -o /app/publish

# Final runtime image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .

# Bind to port 8080 for Render
ENV ASPNETCORE_URLS=http://+:8080

ENTRYPOINT ["dotnet", "TracktionApp.dll"]


