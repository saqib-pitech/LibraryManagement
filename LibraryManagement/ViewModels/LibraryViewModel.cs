using LibraryManagement.Commands;
using LibraryManagement.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LibraryManagement.ViewModels
{
    public class LibraryViewModel : INotifyPropertyChanged
    {
        #region Inotify prop
        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged(string propertyName)
        {
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
        #endregion
        TRAININGEntities db;
        ObservableCollection<ISSUEBOOK> issuanceList= null;
        
        #region Command Vars
        public RelayCommand IssueCommand { get; set; }
        public RelayCommand ClearCommand { get; set; }
        public LibraryViewModel()
        {
            db = new TRAININGEntities();
            issuanceList = new ObservableCollection<ISSUEBOOK>();
            IssueCommand = new RelayCommand(Issue, CanIssue);
            ClearCommand = new RelayCommand(Clear, CanClear);

            var qry = (from issuance in db.ISSUEBOOKs select issuance).ToList();
            IssuanceList = new ObservableCollection<ISSUEBOOK>(qry);
        }
        #endregion
        #region Props
        private ISSUEBOOK issueBookObj = new ISSUEBOOK();
        public string UI_IssueCode
        {
            get { return issueBookObj.ISSUECODE.ToString(); }
            set
            {
                issueBookObj.ISSUECODE = Convert.ToInt32(value);
                OnPropertyChanged("UI_IssueCode");
            }
        }
        public string UI_BookCode
        {
            get { return issueBookObj.BOOKCODE.ToString(); }
            set
            {
                issueBookObj.BOOKCODE = Convert.ToInt32(value);
                OnPropertyChanged("UI_BookCode");
            }
        }
 
        public string UI_MemberCode
        {
            get { return issueBookObj.MEMBERCODE.ToString(); }
            set
            {
                issueBookObj.MEMBERCODE = Convert.ToInt32(value);
                OnPropertyChanged("UI_MemberCode");
            }
        }
        public string UI_IssueDate
        {
            get { return issueBookObj.ISSUEDATE.ToString(); }
            set
            {
                issueBookObj.ISSUEDATE = DateTime.Parse(value);
                OnPropertyChanged("UI_IssueDate");
            }
        }
        public string UI_ReturnDate
        {
            get { return issueBookObj.RETURNDATE.ToString(); }
            set
            {
                issueBookObj.RETURNDATE = DateTime.Parse(value);
                OnPropertyChanged("UI_ReturnDate");
            }
        }
         public string UI_DueDate
        {
            get { return issueBookObj.DUEDATE.ToString(); }
            set
            {
                issueBookObj.DUEDATE = DateTime.Parse(value);
                OnPropertyChanged("UI_DueDate");
            }
        }
        public ObservableCollection<ISSUEBOOK> IssuanceList
        {
            get { return issuanceList; }
            set
            {
                issuanceList = value;
                OnPropertyChanged("IssuanceList");
            }
        }

        #endregion
        #region Methods
        public void Issue(object obj)
        {
        }
        public bool CanIssue(object obj)
        {
            return true;
        }
         public void Clear(object obj)
        {
        }
        public bool CanClear(object obj)
        {
            return true;
        }

        #endregion
    }
}
