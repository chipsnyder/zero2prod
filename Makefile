db:
	sh scripts/init_db.sh

sqlx_offline:
	cargo sqlx prepare -- --lib
	
build:
	docker build --tag zero2prod --file Dockerfile .

run:
	docker run \
	--rm \
	-p 8000:8000 \
	-e APP_DATABASE__REQUIRE_SSL=false \
	-e APP_DATABASE__HOST=host.docker.internal \
	zero2prod

run-local:
	cargo run

prune:
	docker system prune --all --force