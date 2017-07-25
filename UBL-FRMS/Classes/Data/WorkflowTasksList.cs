namespace UBL_FRMS.Classes.Data {
    /// <summary>
    /// Names of List Columns.
    /// Automatically generated on 10/04/2016 17:26:58.
    /// </summary>
    public static class WorkflowTasksList
    {
        public const string ListName = "Workflow Tasks";

        public const string ContentTypeID = "ContentTypeId";

        public const string Title = "Title";

        public const string FileType = "File_x0020_Type";

        public const string Predecessors = "Predecessors";

        public const string Priority = "Priority";

        public static class PriorityChoice
        {
            public const string _1_High = "(1) High";

            public const string _2_Normal = "(2) Normal";

            public const string _3_Low = "(3) Low";

        }
        public const string Status = "Status";

        public static class StatusChoice
        {
            public const string NotStarted = "Not Started";

            public const string InProgress = "In Progress";

            public const string Completed = "Completed";

            public const string Deferred = "Deferred";

            public const string Waitingonsomeoneelse = "Waiting on someone else";

        }
        public const string _Complete = "PercentComplete";

        public const string AssignedTo = "AssignedTo";

        public const string TaskGroup = "TaskGroup";

        public const string Description = "Body";

        public const string StartDate = "StartDate";

        public const string DueDate = "DueDate";

        public const string RelatedItems = "RelatedItems";

        public const string RelatedContent = "WorkflowLink";

        public const string ExternalParticipant = "OffsiteParticipant";

        public const string ExternalParticipantReason = "OffsiteParticipantReason";

        public const string Outcome = "WorkflowOutcome";

        public const string WorkflowName = "WorkflowName";

        public const string TaskType = "TaskType";

        public const string Form_URN = "FormURN";

        public const string FormData = "FormData";

        public const string E_MailBody = "EmailBody";

        public const string HasCustomE_mailBody = "HasCustomEmailBody";

        public const string SendE_mailNotification = "SendEmailNotification";

        public const string PendingModificationTime = "PendingModTime";

        public const string Completed = "Completed";

        public const string WorkflowListID = "WorkflowListId";

        public const string WorkflowItemID = "WorkflowItemId";

        public const string ExtendedProperties = "ExtendedProperties";

        public const string ApprovalOutcome = "ApprovalOutcome";

        public const string Decision = "Decision";

        public const string ApproverComments = "ApproverComments";

        public const string HumanWorkflowID = "HumanWorkflowID";

        public const string ApproverTaskID = "ApproverTaskID";

        public const string MultiOutcomeInfo = "MultiOutcomeTaskInfo";

        public const string GUID = "GUID";

        public const string ID = "ID";

        public const string ContentType = "ContentType";

        public const string Modified = "Modified";

        public const string Created = "Created";

        public const string CreatedBy = "Author";

        public const string ModifiedBy = "Editor";

        public const string Attachments = "Attachments";

        public const string URLPath = "FileRef";

        public const string Path = "FileDirRef";

        public const string Name = "FileLeafRef";

        public const string AppCreatedBy = "AppAuthor";

        public const string AppModifiedBy = "AppEditor";

    }
}
