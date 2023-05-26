trigger CouseDetailtrigger on CourseDetail__c (before insert) {

    CourseDetail__c cd = trigger.new[0];
    cd.CourseName__c =cd.CourseName__c + '2016';
    cd.Fee__c=cd.Fee__c+2000;
    
}