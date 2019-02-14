
var eventIndex;
var pageIndex;

var currentUserName;
var currentUserDescripition;
var globalUserId;
var currentUserinterests;
var currentUserPEvents;
var UserEmail;
var Event_Admin;
var currentEventAdmin ;
var currentEventIDs ;

int i;

class eventData{
  var EventName, StartingDate, FinishingDate, StartingTime, FinishingTime, Accessability, Occur, AdminID, EventID;

  eventData(this.EventName, this.StartingDate, this.FinishingDate, this.StartingTime, this.FinishingTime, this.Accessability, this.AdminID, this.Occur, this.EventID);

}

List<eventData> userEvents;