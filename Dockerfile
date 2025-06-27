# Use the correct .NET 9 SDK and runtime
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copy the .csproj and restore
COPY TracktionApp/*.csproj ./TracktionApp/
RUN dotnet restore TracktionApp/TracktionApp.csproj

# Copy the rest of the source code
COPY . .

# Build the project
WORKDIR /src/TracktionApp
RUN dotnet build -c Release -o /app/build
RUN dotnet publish -c Release -o /app/publish

# Final image
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TracktionApp.dll"]

