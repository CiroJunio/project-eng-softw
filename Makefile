# Compilador C++
CXX = g++

# Flags de compilação: -Wall (mostra todos os warnings) -Iinclude (procura headers em \include)
CXXFLAGS = -Wall -Iinclude

# Diretórios
SRCDIR = src
TESTDIR = test
BINDIR = bin

# --- COMPILAÇÃO PRINCIPAL ---
# Encontra todos os arquivos .cpp em \src
SRCS = $(wildcard $(SRCDIR)/*.cpp)
# Converte a lista de .cpp para .o (ex: src/main.cpp -> bin/main.o)
OBJS = $(SRCS:$(SRCDIR)/%.cpp=$(BINDIR)/%.o)
# O executável principal
TARGET = $(BINDIR)/mainApp

# --- COMPILAÇÃO DE TESTES ---
# Encontra todos os arquivos .cpp em \test
TEST_SRCS = $(wildcard $(TESTDIR)/*.cpp)
# Converte .cpp de teste para .o (ex: test/main.cpp -> bin/test_main.o)
TEST_OBJS = $(TEST_SRCS:$(TESTDIR)/%.cpp=$(BINDIR)/test_%.o)
# O executável de teste (pedido no passo 9)
TEST_TARGET = $(BINDIR)/testeRegressivo

# --- REGRAS (TARGETS) ---

# O comando padrão (se você digitar apenas 'make')
all: $(TARGET)

# Regra para construir o executável principal
$(TARGET): $(OBJS)
	@mkdir -p $(BINDIR) # Cria o diretório \bin se não existir
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET)
	@echo "Executável principal criado em $(TARGET)"

# Regra para construir o executável de teste (para rodar 'make test')
test: $(OBJS) $(TEST_OBJS)
	@mkdir -p $(BINDIR)
	# Note que linkamos tanto os OBJS de \src quanto os de \test
	$(CXX) $(CXXFLAGS) $(OBJS) $(TEST_OBJS) -o $(TEST_TARGET)
	@echo "Executável de teste criado em $(TEST_TARGET)"

# Regra padrão para criar qualquer arquivo .o em \bin a partir de um .cpp em \src
$(BINDIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regra padrão para criar qualquer arquivo test_%.o em \bin a partir de um .cpp em \test
# A LINHA CORRIGIDA ESTÁ AQUI (note o /):
$(BINDIR)/test_%.o: $(TESTDIR)/%.cpp
	@mkdir -p $(BINDIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Regra para limpar os arquivos compilados
clean:
	rm -rf $(BINDIR)/*

.PHONY: all test clean