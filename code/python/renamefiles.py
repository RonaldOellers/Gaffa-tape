import os
infile = input("Which file is the renaming dictionary?")
#infile = 'renaming2.csv'
file = open(infile, 'r')
lines = file.readlines()[1:]
for line in lines:
        line = line.strip() #IMPORTANT TO REMOVE THE SPACES ETC. ELSE TESTING DOES NOT WORK
        line = line.split(',')
        #print(line[1])
        for fname in os.listdir('./'):
            A = str(fname)
            B = str(line[1])
            if line[1] in fname:
                if fname.endswith('_1.fastq'):
                    #print(line[1])
                    #print(fname)
                    os.rename(fname, line[0] + "_R1.fastq")
                    
                if fname.endswith('_2.fastq'):
                    #print(line[1])
                    #rint(fname)
                    os.rename(fname, line[0] + "_R2.fastq")
print("Successfully finished renaming")
