#ifndef KCL_esterel_dispatcher
#define KCL_esterel_dispatcher

#include <stdlib.h>
#include <map>
#include <iostream>
#include <string>
#include <boost/regex.hpp>
#include <boost/concept_check.hpp>

#include "PlanDispatcher.h"

#include "rosplan_knowledge_msgs/KnowledgeItem.h"
#include "rosplan_knowledge_msgs/PerturbStateService.h"
#include "rosplan_dispatch_msgs/EsterelPlan.h"
#include "rosplan_dispatch_msgs/EsterelPlanArray.h"
#include "rosplan_dispatch_msgs/ExecAlternatives.h"
#include <std_srvs/Trigger.h>
#include "std_msgs/String.h"



namespace KCL_rosplan
{
	class AdaptablePlanDispatcher: public PlanDispatcher
	{
	private:

		/**
		 * @returns node ID associated with action ID if it exists, -1 otherwise
		 */
		int getNodeFromActionID(int action_id, bool end_node) {
			std::vector<rosplan_dispatch_msgs::EsterelPlanNode>::const_iterator ci = current_plan.nodes.begin();
			for(; ci != current_plan.nodes.end(); ci++) {
				if(ci->action.action_id == action_id) {
					if(!end_node && ci->node_type == rosplan_dispatch_msgs::EsterelPlanNode::ACTION_START)
						return ci->node_id;
					else if(end_node && ci->node_type == rosplan_dispatch_msgs::EsterelPlanNode::ACTION_END)
						return ci->node_id;
				}
			}
			return -1;
		}

		// esterel plan methods
		void initialise();
	
		// current plan and time plan was recevied
		rosplan_dispatch_msgs::EsterelPlan current_plan;
		std::vector<int> actions_executing;

		// plan status
		std::map<int,bool> edge_active;
		std::map<int,bool> action_dispatched;

		bool state_changed;
		bool finished_execution;

		/* plan graph publisher */
		void printPlan();
		ros::Publisher plan_graph_publisher;

        /* alternative plan generator */
		ros::ServiceClient gen_alternatives_client;

		bool display_edge_type_;

		ros::ServiceClient perturb_client_;

		bool need_to_replan;

		std::map<std::string, int> map_node_id;

		std::map<std::string, double> actions_prob_map;

		int number_actions_dispatched;

		ros::ServiceClient action_counter_client_;

	public:

		/* constructor */
		explicit AdaptablePlanDispatcher(ros::NodeHandle& nh);
		~AdaptablePlanDispatcher();

        void planCallback(const rosplan_dispatch_msgs::EsterelPlanArray plan);

		void reset() override;

		/* action dispatch methods */
		bool dispatchPlan(double missionStartTime, double planStartTime) override;

		/* action feedback methods */
		void feedbackCallback(const rosplan_dispatch_msgs::ActionFeedback::ConstPtr& msg) override;

		void perturbWorldState();

		void printEsterelPlan();

		void makeOnlyNextActionApplicable(std::string next_action_name);

		void printVectorInts(std::vector<int> v, std::string msg);

		void printIntBoolMap(std::map<int,bool> m, std::string msg);

		std::string getFullActionName(rosplan_dispatch_msgs::EsterelPlanNode node);

		std::string getActionNameWithoutTime(rosplan_dispatch_msgs::EsterelPlanNode node);

		void fillProbabilitiesMap(std::string probabilities_file);

		void printStringDoubleMap(std::map<std::string,double> m, std::string msg);
	};
}

#endif
