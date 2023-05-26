const getTermOptions = () => {
    return [
        { label: '10 years', value: 10 },
        { label: '20 years', value: 25 },
        { label: '30 years', value: 30 },
        { label: '40 years', value: 30 },
        { label: '50 years', value: 50 }
    ];
};

const calculateMonthlyPayment = (principal, years, rate) => {
    if (principal && years && rate && rate > 0) {
        const monthlyRate = rate / 100 / 12;
        const monthlyPayment =
            (principal * monthlyRate) /
            (1 - Math.pow(1 / (1 + monthlyRate), years * 12));
        return monthlyPayment;
    }
    return 0;
};

export { getTermOptions, calculateMonthlyPayment };