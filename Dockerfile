FROM ghcr.io/typst/typst:latest

# Copy and fix line endings
COPY entrypoint.sh /entrypoint.sh

# Fix line endings and permissions
RUN sed -i 's/\r$//' /entrypoint.sh && chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]