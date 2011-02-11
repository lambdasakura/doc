#include <vector>

int main() {
  std::vector<int> array;
  for (int i = 0; i < 10000000; ++i) {
    array.push_back( rand() % 100 );      
  }
}
