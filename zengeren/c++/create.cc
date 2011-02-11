#include <stdio.h>
#include <stdlib.h>
class Charactor{
 private:
  int x;
  int y;
public:
  Charactor(int x,int y){
    x=x;
    y=y;
  };
  virtual ~Charactor() {};
};

int main() {
  printf("%d\n",sizeof(Charactor) * 10000000);
  for (int i = 0; i < 10000000; ++i) {
    Charactor* a = new Charactor(rand() % 640 , rand() % 480);
    delete a;
  }
}
