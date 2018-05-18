FROM microsoft/nanoserver

EXPOSE 6379

RUN mkdir C:\data

WORKDIR C:/redis

RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Method Get -Uri https://github.com/MicrosoftArchive/redis/releases/download/win-3.2.100/Redis-x64-3.2.100.zip -OutFile redis.zip ; \
    Expand-Archive redis.zip . ; \
    Remove-Item redis.zip -Force

ENTRYPOINT redis-server
