const compareRowsAsc = (row1, row2) => {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) {
    return -1;
  }
  if (testTitle1 > testTitle2) {
    return 1;
  }
  return 0;
};

const compareRowsDesc = (row1, row2) => {
  const testTitle1 = row1.querySelector('td').textContent;
  const testTitle2 = row2.querySelector('td').textContent;

  if (testTitle1 < testTitle2) {
    return 1;
  }
  if (testTitle1 > testTitle2) {
    return -1;
  }
  return 0;
};

const sortRowsByTitle = () => {
  const table = document.querySelector('table');

  const rows = table.querySelectorAll('tr');
  const sortedRows = [...rows];
  sortedRows.shift();

  const arrowUp = table.querySelector('.octicon-arrow-up');
  const arrowDown = table.querySelector('.octicon-arrow-down');

  if (arrowUp.classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc);
    arrowUp.classList.remove('hide');
    arrowDown.classList.add('hide');
  } else {
    sortedRows.sort(compareRowsDesc);
    arrowDown.classList.remove('hide');
    arrowUp.classList.add('hide');
  }

  const sortedTable = document.createElement('table');
  sortedTable.classList.add('table', 'table-striped');

  const sortedTableThead = document.createElement('thead');
  const sortedTableTbody = document.createElement('tbody');

  sortedTableThead.appendChild(rows[0]);

  for (let i = 0; i < sortedRows.length; i += 1) {
    sortedTableTbody.appendChild(sortedRows[i]);
  }

  sortedTable.appendChild(sortedTableThead);
  sortedTable.appendChild(sortedTableTbody);

  table.parentNode.replaceChild(sortedTable, table);
};

document.addEventListener('turbolinks:load', () => {
  const control = document.querySelector('.sort-by-title');

  if (control) {
    control.addEventListener('click', sortRowsByTitle);
  }
});
