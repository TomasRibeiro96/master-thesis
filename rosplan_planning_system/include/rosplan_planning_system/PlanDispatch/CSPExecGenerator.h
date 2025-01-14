/*
 * Copyright [2019] <KCL - ISR collaboration>
 *
 * KCL: King's College London
 * ISR: Institue for Systems and Robotics
 *
 * Author: Michael Cashmore (michael.cashmore@kcl.ac.uk), Oscar Lima (olima@isr.tecnico.ulisboa.pt)
 *
 * Finds out different options for a plan to be executed.
 *
 */

#ifndef CSP_EXEC_GENERATOR_NODE_H
#define CSP_EXEC_GENERATOR_NODE_H

#include <ros/ros.h>
#include <rosplan_dispatch_msgs/ActionDispatch.h>
#include <rosplan_dispatch_msgs/EsterelPlan.h>
#include <rosplan_dispatch_msgs/EsterelPlanNode.h>
#include <rosplan_dispatch_msgs/EsterelPlanEdge.h>
#include <rosplan_dispatch_msgs/EsterelPlanArray.h>
#include <rosplan_dispatch_msgs/ExecAlternatives.h>
#include <rosplan_dispatch_msgs/CalculateActionsProbabilityService.h>
#include <rosplan_dispatch_msgs/CalculateFullProbabilityService.h>
#include <rosplan_dispatch_msgs/GetNodesLayersService.h>
#include <rosplan_dispatch_msgs/SetupService.h>
#include <rosplan_dispatch_msgs/BacktrackService.h>
#include <diagnostic_msgs/KeyValue.h>
#include "rosplan_action_interface/ActionSimulator.h"
#include <algorithm>


class CSPExecGenerator
{
    public:

        /**
         * @brief constructor, empty
         */
        CSPExecGenerator();

        /**
         * @brief destructor, shutdown publishers and subscribers
         */
        ~CSPExecGenerator();

        /**
         * @brief easy print vector nodes
         * @param msg the name of the node list, e.g. "open list"
         * @param nodes the node list
         */
        void printNodes(std::string msg, std::vector<int> &nodes);

        /**
         * @brief easy print vector nodes' names
         * @param nodes the node list
         */
        std::vector<std::string> getNodesWithNames(std::vector<int> &nodes);

        /**
         * @brief callback to receive the fully ordered esterel plan
         * @param msg the plan is received in this variable, is written by reference
         */
        void esterelPlanCB(const rosplan_dispatch_msgs::EsterelPlan::ConstPtr& msg);

        /**
         * @brief init C : set of temporal constraints
         * @param set_of_constraints return value gets written here by reference
         */
        void initConstraints(std::map<int, int> &set_of_constraints);

        /**
         * @brief check if set of ordered nodes satisfies the set of constraints
         * @param ordered_nodes F or set of ordered nodes
         * @param set_of_constraints C or set of constraints
         * @return true if the set of nodes satisfy the set of constraints, false otherwise
         */
        bool checkTemporalConstraints(std::vector<int> &set_of_ordered_nodes,
            std::map<int, int> &set_of_constraints);

        /**
         * @brief example of how to use the functions of this class
         */
        void testFunctions();

        /**
         * @brief check if curent state (P) satisfies all goals proposed in (G)
         * @param as action simulator object, it contains a method to check if goals ae achieved
         */
        bool areGoalsAchieved(ActionSimulator &as);

        /**
         * @brief input a node id and return the action name and params
         * @param action_id an integer identifying the action by id
         * @param action_name return value is written here by reference
         * @param params return value is written here by reference
         * @param plan the plan from where to extract the actions name and params
         * @return true if node is action start, false if node is action end
         */
        bool getAction(int node_id, std::string &action_name, std::vector<std::string> &params,
            rosplan_dispatch_msgs::EsterelPlan &plan, bool &action_start, int &action_id);

        /**
         * @brief receive as input a node id from a end action node,
         * return by reference the node id of the correspondent action start
         * @param end_node_id input node id, needs to be an action end id
         * @param action_start_node_id return value is written here by reference
         * @return true if function was able to find correspondent start action node id, false if it was unable
         */
        bool getStartNodeID(int end_node_id, int &action_start_node_id);

        /**
         * @brief iterate over open list (O), check if node preconditions are met in current state (P)
         * @param open_list set of unordered nodes
         * @param valid_nodes return value gets written here by reference, list of nodes
         * @return true if valid nodes were found, false otherwise
         */
        bool validNodes(std::vector<int> &open_list, std::vector<int> &valid_nodes);

        /**
         * @brief find all nodes b in open list (O) which ordering constraints enforce them before a
         * @param a integer representing the node id, which is the reference for this function
         * @param open_list the list of nodes which have not yet being ordered
         * @return a list of nodes b ordered before a, e.g. open_list = {1,4,3,2}, a = 3, return = {1, 4}
         */
        std::vector<int> findNodesBeforeA(int a, std::vector<int> &open_list);

        /**
         * @brief backtrack: popf, remove last element from f, store in variable and revert that action
         * @param reason_for_backtrack used for log information and feedback to user
         */
        void backtrack(std::string reason_for_backtrack, bool backtrack_bayes_network);

        /**
         * @brief iterate over the plan, get the probability of each action, multiply them all together
         * @param ordered_nodes a valid ordering of node ids
         * @param action_prob_map a map from node ids to probabilities, this was constructed during orderNodes recursive call
         * @return double the combined plan propagated probability, in oder words: the probability of the plan of being executable
         */
        double computePlanProbability(std::vector<int> &ordered_nodes, std::map<int, double> &action_prob_map);

        std::string getStateAsString(std::vector<rosplan_knowledge_msgs::KnowledgeItem> state);

        bool factsAreEqual(rosplan_knowledge_msgs::KnowledgeItem fact1, rosplan_knowledge_msgs::KnowledgeItem fact2);

        /**
         * @brief checks if two states are the same
         * @param state1
         * @param state2
         * @return true if states are equal, false otherwise
         */
        bool statesAreEqual(std::vector<rosplan_knowledge_msgs::KnowledgeItem> state1, std::vector<rosplan_knowledge_msgs::KnowledgeItem> state2);
        
        std::string buildActionName(std::string action_name, std::vector<std::string> params, bool action_start);

        /**
         * @brief returns an action's name with parameters
         * @param action_name
         * @param params
         * @param action_start true if it's action start and false otherwise
         * @return action_name%param1%param2...
         */
        std::string getFullActionName(int a);

        /**
         * @brief simulates action
         * @param action_start true if it is action start, false otherwise
         * @param action_name
         * @param params
         * @return true if action was successfully simulated, false otherwise
         */
        bool simulateAction(bool action_start, std::string action_name, std::vector<std::string> params);


        std::vector<rosplan_knowledge_msgs::KnowledgeItem> getStateAfterAction(std::string action_name,
                                                                                std::vector<std::string> params,
                                                                                std::vector<int> open_list);

        /**
         * @brief splits string on delimeter
         * @param strToSplit
         * @param delimeter
         * @return vector of strings
         */
        std::vector<std::string> split(std::string strToSplit, char delimeter);

        void fillExpectedFacts(std::vector<std::string> expected_predicates);

        /**
         * @brief shift nodes from open list (O) to ordered plans (R) offering different execution alternatives
         * @param open_list the list of nodes which have not yet being ordered, at startup is composed of all nodes
         * in the partially ordered plan, later the game is take from it the applicable nodes and pass them to
         * the ordered list (which is used also as stack for the DFS search with backtrack)
         * @return true if at least one valid execution was found, false otherwise
         */
        bool orderNodes(std::vector<int> open_list, int &number_expanded_nodes);

        /**
         * @brief backtrack: popf, remove last element from f, store in variable and revert that action
         * @param reason_for_reverse used for log information and feedback to user
         */
        void reverseLastAction(std::string reason_for_reverse);

        bool stateHasFact(std::vector<rosplan_knowledge_msgs::KnowledgeItem> state, rosplan_knowledge_msgs::KnowledgeItem fact);

        bool stateContainsFacts(std::vector<rosplan_knowledge_msgs::KnowledgeItem> state,
                                        std::vector<rosplan_knowledge_msgs::KnowledgeItem> facts);

        /**
         * @brief checks if current state contains the facts in any layer of expected_states_
         * @return index of the latter layer which contains facts present in the current state.
         *         Returns -1 if the facts are not present in any layer
         */
        int currentStateContainsExpectedFacts();

        /**
         * @brief generate plan alternatives based on search
         * @return true if succeeded
         */
        bool generatePlans();

        /**
         * @brief iterate over input esterel plan edges, compare input edge id with all of the edges, if there is
         * a match, return the edge by reference
         * @param edge_id the edge id to found in the plan
         * @param esterel_plan an esterel plan
         * @param edge return value is written here by reference, an esterel edge
         * @return true if edge was found, false if edge was not found
         */
        bool getEdgeFromEdgeID(int edge_id, rosplan_dispatch_msgs::EsterelPlan &esterel_plan,
        rosplan_dispatch_msgs::EsterelPlanEdge &edge);

        /**
         * @brief iterate over the edges of the received esterel plan and delete all conditional edges
         * @param esterel_plan the plan from which you want to remove its conditional edges
         * @param ordered_nodes the list of nodes to be included in the plan, nodes which are not in here will be removed
         * @return esterel plan output, a modified version of the input plan, without conditional edges
         */
        rosplan_dispatch_msgs::EsterelPlan removeConditionalEdges(
                rosplan_dispatch_msgs::EsterelPlan &esterel_plan, std::vector<int> &ordered_nodes);

        /**
         * @brief add constrains to the partially ordered plan (esterel plan without conditional edges)
         * @param ordered_nodes input, a totally odered list of nodes, which contains one possible way of executing the plan
         * @return esterel plan msg
         */
        rosplan_dispatch_msgs::EsterelPlan convertListToEsterel(std::vector<int> &ordered_nodes);

        /**
         * @brief service callback with user request to generate execution alternatives
         * @param req input from user gets received in this variable
         * @param res service response gets written here by reference, true if at least
         * one possible execution was found, false if replan is needed (means plan is invalid)
         * @return true if service finished execution, false otherwise
         */
        bool srvCB(rosplan_dispatch_msgs::ExecAlternatives::Request& req,
                   rosplan_dispatch_msgs::ExecAlternatives::Response& res);

        /**
         * @brief wait for callbacks to arrive
         */
        void update();

        bool isStartAction(int a);

        bool atStartAlreadyExecuted(int a);

        bool actionsHaveSameNameAndParams(int action1, int action2);

        void removeStartActionFromOccurringActions(int action);

        double getCurrentPlanProbabilityAndFillExpectedFacts();

        void printVectorOfStrings(std::string msg, std::vector<std::string> vec);

        void printExpectedFacts();

        void reusePreviousPlan(int index_facts);

        int getActionEndLayer(int action);

        void backtrackBayesianNetwork();

        bool isNodeAnActionOcurring(int node);

        std::string getActionNameWithoutTime(int a);

        std::string buildActionNameWithoutTime(std::string action_name, std::vector<std::string> params);

        std::vector<int> getActionsStartedButNotFinished(std::vector<int> action_executing_);

        int getAtStartFromExecuting(int a);

        void printVectorInts(std::vector<int> vec, std::string str);

        bool atStartAlreadyInActionsExecuted(int a);

    private:
        // ros related variables
        ros::NodeHandle nh_;
        ros::Publisher pub_valid_plans_, pub_esterel_plan_;
        ros::Subscriber sub_esterel_plan_;
        ros::ServiceServer srv_gen_alternatives_;
        ros::ServiceClient calculate_actions_prob_client_;
        ros::ServiceClient calculate_full_prob_client_;
        ros::ServiceClient setup_client_;
        ros::ServiceClient get_nodes_layers_client_;
        ros::ServiceClient backtrack_client_;

        /// flag used to know when we have received a callback
        bool is_esterel_plan_received_;

        /// stores the received msg in esterel plan callback
        rosplan_dispatch_msgs::EsterelPlan original_plan_;

        /// to cap the max depth search to a certain value
        int max_search_depth_;

        /// P: to simulate actions in a private (own) KB
        ActionSimulator action_simulator_;

        /// C: set of constraints
        std::map<int, int> set_of_constraints_;

        // F: store the set of ordered nodes id's, empty at the beginning
        std::vector<int> ordered_nodes_;

        /// Information coming from the service call gets saved into member variable
        /// it tells which nodes are currently being/done executed
        std::vector<int> action_executing_;

        /// map of actions and associated probabilities of success
        std::map<int, double> action_prob_map_;

        /// the msg that contains all the esterel plans to be published
        /// R: is stored in exec_aternatives_msg_.esterel_plans
        rosplan_dispatch_msgs::EsterelPlanArray exec_aternatives_msg_;

        std::vector<std::vector<rosplan_knowledge_msgs::KnowledgeItem>> expected_facts_;
        
        std::vector<int> best_plan_;

        std::vector<int> actions_occurring_;

        int action_to_be_executed_;

};
#endif  // CSP_EXEC_GENERATOR_NODE_H
