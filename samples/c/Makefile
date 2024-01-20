TARGET_EXEC := bin
BUILD_DIR := ./build
SRC_DIR := ./src
INC_DIR := ./inc

CC := gcc
CFLAGS := -O0 -g -Werror -Wall -Wextra -std=c17
LDFLAGS :=
CPPFLAGS := -I$(SRC_DIR)/$(INC_DIR) -MMD -MP

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(SRCS:$(SRC_DIR)/%.c=$(BUILD_DIR)/%.o)
DEPS := $(OBJS:.o=.d)

# Valgrind
VALGRIND_FILE := valgrind.txt
VALGRIND_FLAGS := --leak-check=full --show-leak-kinds=all --track-origins=yes --verbose --log-file=$(VALGRIND_FILE)

.PHONY: all clean run valgrind

all: $(BUILD_DIR)/$(TARGET_EXEC)

$(BUILD_DIR)/$(TARGET_EXEC): $(OBJS)
	$(CC) $^ -o $@ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)
	rm -f $(VALGRIND_FILE)

run:
	@$(BUILD_DIR)/$(TARGET_EXEC)

valgrind:
	valgrind $(VALGRIND_FLAGS) $(BUILD_DIR)/$(TARGET_EXEC)
	nvim $(VALGRIND_FILE)

-include $(DEPS)
