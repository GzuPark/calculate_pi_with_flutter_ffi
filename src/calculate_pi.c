double calculatePi(int nIter) {
    double result = 0.0;
    double numerator = 4.0;
    double denominator = 1.0;
    double operation = 1.0;

    for (int i = 0; i < nIter; ++i) {
        result += operation * (numerator / denominator);
        denominator += 2.0;
        operation *= -1.0;
    }

    return result;
}
