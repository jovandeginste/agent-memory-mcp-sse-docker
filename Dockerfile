FROM node

ENV MEMORY_DB_PATH=/memory
RUN apt-get update && apt-get -y install pipx
RUN npm install -g @adamrdrew/agent-memory-mcp
RUN pipx install mcp-proxy

VOLUME ["/memory"]
ENTRYPOINT ["/root/.local/bin/mcp-proxy"]
CMD ["--host=0.0.0.0", "--port=8080", "-e", "MEMORY_DB_PATH", "${MEMORY_DB_PATH}", "--", "/usr/local/bin/agent-memory-mcp"]
