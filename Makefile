.PHONY: gen clean

# Пути к proto файлам
PROTO_FILES = proto/auth/v1/auth.proto \
             proto/client/v1/client.proto \
             proto/media/v1/media.proto \
             proto/order/v1/order.proto \
             proto/store/v1/store.proto \
             proto/user/v1/user.proto \
			 proto/product/v1/product.proto

# Генерация Go файлов из proto
gen:
	@echo "Generating Go files from proto..."
	protoc --go_out=gen/go --go_opt=paths=source_relative \
		--go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
		$(PROTO_FILES)
	@echo "Done!"

# Очистка сгенерированных файлов
clean:
	@echo "Cleaning generated files..."
	@rm -rf gen/go
	@echo "Done!"