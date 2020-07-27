# Sample script to check if pytorch is avaible and can use Grid GPU

print("Pytorch available?")
import  torch
print("True")

print("Cuda available?")
print(torch.cuda.is_available())
print("Success!")
#print(torch.cuda.current_device())
