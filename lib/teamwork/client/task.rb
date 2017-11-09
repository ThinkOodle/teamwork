module Teamwork
  class Client

    module Task

      # GET time entries for the project
      # options:
      #   page: UnsignedInt
      #   fromdate: YYYYMMDD
      #   fromtime: HH:MM
      #   todate: YYYYMMDD
      #   totime: HH:MM
      #   sortorder: (ASC, DESC) (defaults to ascending order by date (oldest to newest))
      # Return [Teamwork::Thing]
      def task_timers(task_id, options)
        objects_from_response(:get, "todo_items/#{task_id}/time_entries", "time-entries", options)
      end

      # GET all tasks across all projects
      # options:
      #   filter: (all, anytime, overdue, today, tomorrow, thisweek, within7, within14, within30, within365, nodate, nostartdate, completed)
      #   page: UnsignedInt
      #   pageSize: 250 (the amount of tasks to return per page)
      #   startdate: YYYYMMDD
      #   endDate: YYYYMMDD
      #   updatedAfterDate: YYYYMMDD
      #   showDeleted: Boolean (default false)
      #   includeCompletedTasks: Boolean (default false)
      #   includeCompletedSubtasks: Boolean (default false)
      #   creator-ids: Comma-delimited list of user ids
      #   include: (nodate, nostartdate, noduedate, overdue)
      #   responsible-party-ids (-1 (all assigned), 0 (all unassigned), or specific user ids as a comma-delimited-list)
      #   sort (duedate, startdate, dateadded, priority, project, company)
      #   getSubTasks: Boolean (default true)
      #   nestSubTasks: Boolean (default false)
      #   getFiles: Boolean (default false)
      #   dataSet: String (default full) (options: full, newTaskDefaults)
      #   includeToday: Boolean (default true) (When using the filter option with any of the following options; within7,within14,within30,within365. You can choose to exclude deadlines for today by passing this parameter as false.)
      #   ignore-start-dates: Boolean (default false) (When using the filter option, you can choose to include start dates matching the filtering critera by passing this parameter as true. By default, only due dates are checked against the filter.)
      # Return [Teamwork::Thing]
      def all_tasks(options = {})
        objects_from_response(:get, "tasks", "todo-items", options)
      end


      # Post a new Task
      # options:
      #   *content: string (name of the task you are adding)
      #   description :string Tasks can be assigned a description.
      #   parentTaskId :string Set this to the ID of a parent task if you wish to make your task a subtask.
      #   progress :int Set the progress from 0 to 90
      #   notify :boolean This parameter can be set to true to notify people assigned to this task by email.
      #   responsible-party-id :string This can be used to assign the new task to a person or group of people. For example: -1 would assign the task to everyone 32 would assign the task to user 32. 32,55 would assign the task to users 32 and 55 etc.
      #   start-date :string Tasks can be assigned a date to start on. The format should be YYYYMMDD.
      #   due-date :string Tasks can be assigned a date for when they are due to be finished. The format should be YYYYMMDD.
      #   priority :string Tasks can be assigned the following priorities: not set low medium high
      #   tags :string  A comma separated list of tags for the task
      #   commentFollowerIds :string A comma separated list of user ids to add as followers for comments on this task
      #   changeFollowerIds :string  A comma separated list of user ids to add as followers for changes on this task
      #   private :int    Set to 1 to make the task Private. Setting a 0 will set the Task back to normal

      def create_task(tasklist_id, options = {})
        #object_from_response(:post, "tasklists/#{tasklist_id}/tasks", "todo-item", options)
      end

    end

  end
end