import numpy as np
import matplotlib.pyplot as plt
from scipy import signal
from scipy.fftpack import fft, fftfreq


def sine(f, t, a=1):
    return a * np.sin((2 * np.pi * f ) * t)


def mixed_sine(freqs, time):
    sig = np.zeros((len(freqs), len(time)))
    for i, freq in enumerate(freqs):
        sig[i, :] = sine(f=freq, t=time, a=np.random.randint(1, 10))
    return np.sum(sig, 0)


def fourier(sig, fs, n=None):
    if n is None:
        n = len(sig)
    sigX = fft(sig, n)
    sigX = sigX / n
    f = fftfreq(n, 1/fs)
    return sigX[f >= 0], f[f >= 0]


def fir_taps(order, fs, lower_cut_off):
    order = np.round(order * (fs / lower_cut_off))
    if order % 2 == 0:
        order += 1
    return order