FROM rust:1.74 as build-env
WORKDIR /app
COPY . /app
RUN cargo build --release

#FROM gcr.io/distroless/cc
FROM gcr.io/distroless/cc-debian12
COPY --from=build-env /app/target/release/rust-docker /
CMD ["/rust-docker"]
