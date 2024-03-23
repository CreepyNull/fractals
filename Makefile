CC = cc
FLAGS =  -Wall -Wextra -Werror

FILE_NAME = fractol
MLX = -L /usr/local/lib/ -lmlx -lX11 -lXext -lm

SRC_DIR = src
OBJ_DIR = obj

SRCS = $(shell find $(SRC_DIR) -name "*.c")
OBJS = $(patsubst $(SRC_DIR)/%.c, $(OBJ_DIR)/%.o, $(SRCS))

INCLUDE = -I ./include/

RM = rm -rf

all: $(FILE_NAME)

bonus: all

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c 
	@mkdir -p $(OBJ_DIR)
	@echo "Compiling $<..."
	@$(CC) $(FLAGS) $(INCLUDE) -c $< -o $@

$(FILE_NAME): $(OBJS)
	@echo "Linking $(FILE_NAME)..."
	@$(CC) $(FLAGS) $(INCLUDE) $^ $(MLX) -o $(FILE_NAME)
	@echo "Done!"

clean:
	@echo "Cleaning..."
	@$(RM) $(OBJS)
	@echo "Done!"

fclean: clean
	@echo "Removing out file..."
	@$(RM) $(FILE_NAME)
	@echo "Done!"

re: fclean all