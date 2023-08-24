SOURCE := ./euler/src/main.rs
TARGET := ./euler/target/release/euler

run: $(TARGET)
	$(TARGET)

$(TARGET): $(SOURCE)
	cd ./euler && cargo build --release

clean:
	cd ./euler && cargo clean
