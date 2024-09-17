output = []

for A in range(0, 16):
    for B in range(0, 16):
        output.append(A + B)
        output.append(max(A - B, 0))
        output.append(A * B)
        output.append(A // B if B != 0 else 0)


def toBinary(n):
    return bin(n)[2:].rjust(4, "0")


def numberTo3BCD(n):
    digits = [n // 100, (n // 10) % 10, n % 10]
    return "".join(list(map(toBinary, digits)))


bitOutputs = list(map(numberTo3BCD, output))

print("\n".join(bitOutputs))
