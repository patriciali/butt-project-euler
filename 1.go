package main

import (
       "fmt"
       "math"
)

func main() {
     var sum int = 0
     for i := 1; i < 1000; i++ {
         if math.Mod(float64(i), 3) == 0 || math.Mod(float64(i), 5) == 0 {
            sum += i
         }
     }
     fmt.Println(sum)
}