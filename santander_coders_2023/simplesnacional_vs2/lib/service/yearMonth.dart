class yearMonth{

  yearMonth();

   late String selectedMonth;
   late int selectedYear;

  static List<int> years = List.generate(DateTime
      .now()
      .year - 2017, (index) => 2018 + index);

  static List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];


  String getPreviousMonth(int index,String selectedMonth) {
    final currentMonthIndex =  yearMonth.months.indexOf(selectedMonth);
    int previousMonthIndex = (currentMonthIndex - index - 1) % 12;
    // Ajuste para considerar anos diferentes
    if (previousMonthIndex < 0) {
      previousMonthIndex += 12;
    }
    return yearMonth.months[previousMonthIndex];
  }

  // Função para obter o ano anterior
  int getPreviousYear(int index,String selectedMonth,int selectedYear) {
    final currentMonthIndex = yearMonth.months.indexOf(selectedMonth);
    final currentYear = selectedYear;
    int year = currentYear;
    // Ajuste para considerar anos diferentes
    if (currentMonthIndex - index <= 0) {
      year--;
    }
    return year;
  }
}