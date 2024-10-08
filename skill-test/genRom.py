rom_size = 2 ** 14


def toBin(n):
    return bin(n)[2:].rjust(4, "0")


for i in range(0, rom_size):
    if i > 9999:
        print("1" * 16)
    else:
        d3 = i // 1000
        d2 = (i % 1000) // 100
        d1 = (i % 100) // 10
        d0 = i % 10

        print(f"{toBin(d3)}{toBin(d2)}{toBin(d1)}{toBin(d0)}")
