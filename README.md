# Task-4-FIR-Filter-Design


company : CODTECH IT SOLUTIONS 
NAME : ARIGELLA VIJAY KUMAR 
Intern ID:CT04DG3476
DOMAIN : VLSI
BATCH DURATION :  June 23rd, 2025 to July 23rd, 2025. 
MENTOR  NAME : Neela Santhosh Kumar 

In this task, I designed and simulated a simple Finite Impulse Response (FIR) filter using Verilog HDL. FIR filters are a fundamental component in digital signal processing and are widely used to process discrete-time signals in systems such as audio processors, communication receivers, and image processing pipelines. They are called "finite" because they have a finite number of coefficients, and their response to an impulse settles to zero in a finite duration.

The main objective of this task was to understand how an FIR filter works at the hardware level and how to implement it using Verilog. The FIR filter designed in this task uses four taps (coefficients), making it a 4-tap filter. The output of the FIR filter is a weighted sum of the current input and a few previous inputs. Mathematically, it can be expressed as: y[n] = h0*x[n] + h1*x[n-1] + h2*x[n-2] + h3*x[n-3], where h0, h1, h2, and h3 are the filter coefficients.

In my design, the coefficients were set as 1, 2, 3, and 4 respectively for demonstration purposes. These coefficients are stored in a coefficient array h[]. A register array x_reg[] is used to store the latest four input samples. On each positive clock edge, the input samples are shifted, and the newest sample is inserted at the first position. The multiply-and-accumulate operation is performed to generate the output y_out.

The module FIR_Filter contains the core logic for the filter. It includes a for loop to handle the shifting of input samples through the register array, and a calculation for the weighted sum using the defined coefficients. Additionally, a reset signal is provided to initialize the sample registers and output.

To verify the correctness of the design, I developed a comprehensive testbench (FIR_Filter_tb). The testbench initializes the filter, applies a sequence of input samples (5, 10, 15, 20, and 25), and observes the output response. It also generates a clock signal and handles the reset operation to ensure the filter starts from a known state. The simulation uses `$dumpfile` and `$dumpvars` system tasks to produce a VCD (Value Change Dump) file for waveform viewing.

Upon simulating the design and observing the waveform, I could clearly see the input samples being shifted and the output responding according to the FIR filter equation. The output waveform shows how each new input sample affects the output result as it propagates through the filter taps, demonstrating the filter’s transient and steady-state behavior.

Through this task, I gained hands-on experience in designing and simulating digital filters, which are a key part of DSP systems. I learned the importance of register arrays for implementing delay lines in hardware and how to use Verilog to model real-world signal processing components. I also improved my understanding of multiply-and-accumulate operations in FPGA and ASIC design.

All the design files, testbench code, and waveform screenshots are documented and saved in my GitHub repository. This task has significantly improved my confidence and technical capability in designing complex digital systems and has laid a strong foundation for future work in signal processing and advanced VLSI design.
