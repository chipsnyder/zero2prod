db:
	sh scripts/init_db.sh

sqlx_offline:
	cargo sqlx prepare -- --lib
	
docker:
	docker build --tag zero2prod --file Dockerfile .

run:
	docker run -p 8000:8000 zero2prod

prune:
	docker system prune --all --force