#include <iostream>
#include <cassert>
#include "bib.hpp" // (Ainda não existe)

int main() {
    std::cout << "Testando fatorial(5)..." << std::endl;
    assert(fatorial(5) == 120);
    std::cout << "Testes finalizados com sucesso!" << std::endl;
    return 0;
}