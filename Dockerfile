# denoland/deno:ubuntu might be required for some builds
FROM denoland/deno:alpine AS build
WORKDIR /app
COPY package.json deno.* ./
RUN deno install
COPY . .
RUN deno task build

FROM denoland/deno:alpine AS runtime
ARG PORT=3000
ENV PORT=$PORT
EXPOSE $PORT
COPY --chown=deno:deno --from=build /app/build /home/deno
WORKDIR /home/deno
USER deno
CMD ["sh", "-c", "deno run -E -N=0.0.0.0:$PORT -R=/home/deno index.js"]
