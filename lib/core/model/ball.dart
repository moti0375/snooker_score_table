enum Ball{
  red,
  yellow,
  green,
  brown,
  blue,
  pink,
  black
}

extension BallValue on Ball{
  int get value {
    switch (this){
      case Ball.red:
        return 1;
      case Ball.yellow:
        return 2;
      case Ball.green:
        return 3;
      case Ball.brown:
        return 4;
      case Ball.blue:
        return 5;
      case Ball.pink:
        return 6;
      case Ball.black:
        return 7;
    }
  }
}