#include <iostream>
#include <cassert>
#include "bib.hpp" 

int main() {
    std::cout << "Testando fatorial(5)..." << std::endl;
    assert(fatorial(5) == 120);

    std::cout << "Testando fibonacci(7)..." << std::endl;
    assert(fibonacci(7) == 13);

    std::cout << "Testes finalizados com sucesso!" << std::endl;
    return 0;
}